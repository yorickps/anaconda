anaconda::env{'test1':}
anaconda::package{['dnspython','pyside','sympy']:
  env => 'test1'
}

