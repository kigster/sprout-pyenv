pythons        = node['sprout']['pyenv']['pythons']
default_python = node['sprout']['pyenv']['default_python']

package 'pyenv'

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

execute "adding pyenv initialization to your ~/.bashrc" do
  command %q{ printf "\nif which pyenv > /dev/null; then eval s\"$(pyenv init -)\"; fi\n" >> ~/.bashrc }
  user node['sprout']['user']
  not_if "grep 'which pyenv' ~/.bashrc"
end
