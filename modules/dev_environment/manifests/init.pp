class dev_environment {
  user { 'rudra.magar':
    ensure      => present,
    managehome => true,
    groups       => ['wheel'],
  }

  package { 'vim':
    ensure      => present,
  }

  file { '/home/rudra.magar/.vimrc':
    ensure      => file,
    content     => template('dev_environment/vimrc.erb'),
    owner       => 'rudra.magar',
    mode        => '0644',
  }

  file { '/usr/local/bin/puppetd':
    ensure      => file,
    content     => template('dev_environment/puppetd.sh.erb'),
    mode        => '0755',
    owner       => 'root',
    group      => 'root'
  }

  file { '/usr/bin/puppetd':
    ensure      => link,
    target      => '/usr/local/bin/puppetd',
    owner       => 'root',
    group       => 'root',
  }

  package { 'ruby':
    ensure      => installed,
  }

  package { 'r10k':
    ensure      => installed,
    provider    => 'gem',
    require     => Package['ruby'],
  }

  file { '/usr/local/bin/g10kd':
    ensure      => file,
    content     => template('dev_environment/g10k.sh.erb'),
    mode        => '0755',
    owner       => 'root',
    group       => 'root',
    require     => Package['r10k'],
  }

  file { '/usr/bin/g10kd':
    ensure      => link,
    target      => '/usr/local/bin/g10kd',
    owner       => 'root',
    group       => 'root',
  }

}
