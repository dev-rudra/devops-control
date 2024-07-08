class site_modules {
  file { '/opt/puppetlabs/facter/facts.d/environment.rb':
    ensure      => file,
    content     => template('site_modules/environment.rb.erb'),
    mode        => '0644',
    owner       => 'root',
    group       => 'root',
  }
}
