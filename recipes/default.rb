pythons        = node['sprout']['pyenv']['pythons']
default_python = node['sprout']['pyenv']['default_python']

node.default['homebrew']['formulas'] = [ name: 'pyenv', head: true ]

include_recipe 'homebrew::install_formulas'

sprout_base_bash_it_enable_feature 'plugins/pyenv'

pythons.each do |version, options|
  python_install version do
    options options
  end
end

execute "making #{default_python} with pyenv the default" do
  command "pyenv global #{default_python}"
  user node['sprout']['user']
  not_if { default_python.nil? }
end

ruby_block 'append initialization of pyenv to ~/.bashrc' do
  block do
    File.open("#{ENV['HOME']}/.bashrc", 'a') do |f|
      f.puts 'eval "$(pyenv init - 2>/dev/null)" '
    end
  end
  action :run
  not_if 'grep "pyenv init" ~/.bashrc'
end
