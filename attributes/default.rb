node.default['sprout']['pyenv'] = {
  'home' => "#{node['sprout']['home']}/.pyenv",
  'command' => '/usr/local/bin/pyenv',
  'pythons' => {
      '2.7.11' => {}
    },
  'default_python' => '2.7.11',
}
