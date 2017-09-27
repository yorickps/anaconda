
anaconda::channel{'bioconda':
}

anaconda::env{'test3':
  anaconda_version => '4.4.0',
  python           => '3.6',
  numpy            => '1.12.1',
  exec_timeout     => '900',
  require          => Anaconda::Channel['bioconda'],
}

Anaconda::Package{['prinseq']:
  env => 'test3'
}