# Creates an environment with Anaconda, Python, and Numpy
# To add packages see anaconda::package

define anaconda::env(
  $anaconda_version = '4.2.0',
  $numpy            = '1.7',
  $python           = '3.5',
  $base_path        = '/opt/anaconda',
  $exec_timeout     = '300',
) {
  anchor{"anaconda::env::${title}::begin":}
  include anaconda

  $conda = "${base_path}/bin/conda"

  exec { "anaconda_env_${name}":
    #command => "${conda} create --yes --quiet \
    command => "${conda} create --yes         \
                --name=${name} anaconda=${anaconda_version} numpy=${numpy} \
                python=${python}",
    creates => "${base_path}/envs/${name}",
    timeout => $exec_timeout,
    require => Class['anaconda::install'],
  }

  anchor{"anaconda::env::${title}::end":
    require => Exec["anaconda_env_${name}"],
  }
}
