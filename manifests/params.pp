# Parameters class.
class anaconda::params {

  $base_url = $::domain ? {
    #'atx.continuum.io'=>'http://filer.atx.continuum.io/released/1.5.0',
    default           =>'http://repo.continuum.io/archive',
  }

  $base_path = '/opt/anaconda'
  $anaconda_version = '5.2.0'
  #should x86_64 be replaced by ${facts['hardware']} ?
  $installer = $::kernel ? {
    /(L|l)inux/ => "Anaconda3-${anaconda_version}-Linux-x86_64.sh",
    'windows'   => "Anaconda-${anaconda_version}-Windows-x86_64.exe",
    'Darwin'    => "Anaconda3-${anaconda_version}-MacOSX-x86_64.sh",
  }

  #TODO: add support for other versions

  $url = "${base_url}/${installer}"
}


