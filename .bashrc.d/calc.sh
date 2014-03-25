calc()
{
  bc -l <<DONE
scale = 20

pi = 4*a(1)

define sin(x) { return (s(x)) }
define cos(x) { return (c(x)) }
define tan(x) { return (s(x)/c(x)) }

define asin(x) {
  if (x == 1) return (pi/2)
  if (x == -1) return (-pi/2)
  return ( a(x / sqrt(1 - (x*x))) )
}
define acos(x) {
  if (x == 1) return (0)
  if (x == -1) return (pi)
  return ( pi/2 - a(x / sqrt(1 - (x*x))) )
}
define atan(x) { return (a(x)) }
define atan2(y,x) {
  auto z
  if (x == 0) { if (y >= 0) return (pi/2) else return (-pi/2) }
  z = a(y/x)
  if (x < 0) { if (z < 0) z += pi else z -= pi }
  return z
}

e = e(1)
define exp(x) { return (e(x)) }

define ln(x) { return (l(x)) }
define log(x,b) { return ( l(x) / l(b) ) }

define abs(x) {
  if (x >= 0) return (x)
  return (-x)
}

$@

DONE
}
