
group { 'puppet':
  ensure => present,
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
content => "Welcome to your Vagrant-built virtual machine!\
            Managed by Puppet.\n"
}
file { '/home/vagrant/.vimrc':
  owner   => 'vagrant',
  group   => 'vagrant',
  content => ":set tabstop=4\n\
:set shiftwidth=4\n\
:set expandtab\n"
}

package { 'bundler':
  ensure   => 'installed',
  provider => 'gem',
}