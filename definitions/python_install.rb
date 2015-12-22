define :python_install do
  python_version = params[:version] || params[:name]
  options = params[:options] || {}

  include_recipe "sprout-pyenv"

  pyenv_cmd = node['sprout']['pyenv']['command']
  install_cmd = "#{pyenv_cmd} install #{python_version} #{options[:command_line_options]}"

  execute "installing #{python_version} with pyenv: #{install_cmd}" do
    command install_cmd
    user params[:user] || node['sprout']['user']
    only_if params[:only_if] if params[:only_if]
    not_if params[:not_if] || "#{pyenv_cmd} versions | grep #{python_version}"
    env options[:env]
  end

  execute "check #{python_version}" do
    command "#{pyenv_cmd} versions | grep #{python_version}"
    user params[:user] || node['sprout']['user']
  end
end
