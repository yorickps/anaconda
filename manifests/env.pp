# Creates an environment with Anaconda, Python, and Numpy
# To add packages see anaconda::package

define anaconda::env( 
    $language=undef,
    $version='3.5',
    $anaconda_version='4.2.0',
    $base_path='/opt/anaconda') {

    include anaconda

    $conda = "${base_path}/bin/conda"


    case $language {
      'r', 'R'           : { $options = "-c r" }
      'python', 'Python' : { $options = "python=${version}" }
      default:             { $options = "python=${version}" }
    }


    exec { "anaconda_env_${name}":
        command => "$conda create --yes --quiet \
                    --name=${name} anaconda=${anaconda_version} \
                    ${options}",
        creates => "${base_path}/envs/${name}",
        require => Class["anaconda::install"],
    }
}
