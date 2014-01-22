# defined type allows you to declare a BIND TSIG.
#
# Parameters:
#
# $ensure = ensure the persence or absence of the acl.
# $keyname = the name given to the TSIG KEY. This must be unique. This defaults to
#   the namevar.
#
# Usage:
#
# dns::tsig { 'ns3':
#   ensure => present,
#   algorithm => "hmac-md5"
#   secret    => "dTIxGBPjkT/8b6BYHTUA=="
# }
#
define dns::tsig (
  $keyname   = $name,
  $algorithm = 'hmac-md5',
  $server    = undef,
  $secret    = undef,
  $ensure    = present
) {

#  validate_string($name)
#  validate_string($algorithm)
#  validate_string($server)
#  validate_string($secret)

  concat::fragment { "named.conf.local.tsig.${name}.include":
    ensure  => $ensure,
    target  => '/etc/bind/named.conf.local',
    order   => 4,
    content => template("${module_name}/tsig.erb"),
  }

}
