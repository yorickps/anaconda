# Defined Type: anaconda::channel
# Adds a channel to the anaconda environment
#
#
# [Required Parameters]
# * `channel`
#   The channel to add.
#
# * `env`
#   The environment to add the channel to.
#

define anaconda::channel(
  $channel   = $title,
  $base_path = '/opt/anaconda'
) {

  anchor{"anaconda::channel::${title}::begin":}

  include anaconda

  $conda = "${base_path}/bin/conda"


  exec { "anaconda_channel_${name}":
      command => "${conda} config --add channels ${channel}",
      require => Anchor["anaconda::channel::${title}::begin"],
      unless  => "${conda} config --get channels ${name}\
       | grep -q -w -i '${name}'",
  }

  anchor{"anaconda::channel::${title}::end":
    require => Exec["anaconda_channel_${name}"],
  }
}