anaconda::env{'test1':}
#anaconda::package{['dnspython','pyside','sympy']:
anaconda::package{['sympy']:
  env => 'test1'
}

