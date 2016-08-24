# == Class: rkt::params
#
# Settings for the rkt module
#
class rkt::params {
  $version = '1.13.0'
  $acbuild_version = '0.4.0'
  $ensure = 'present'
}
