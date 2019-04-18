      subroutine vpot(r,v,vp,vpp)
      implicit real*8 (A-H,O-Z)
      parameter (expmax=666.e0)
      save a,alp,d,c6,c8,c10,sigma,rm,eps
      data a,alp,d,c6,c8,c10,sigma,rm,eps /544850.4,13.353384,1.241314,
     +1.3732412,.4253785,.1781,2.556,2.9673,10.8/
      units=sigma/rm
      y=rm/(sigma*r)
      v1=a*eps*exp(-alp/y)
      v1p=-alp*units*v1
      v1pp=-alp*units*v1p
      x2=y*y
      f=eps
      fp=0.
      dy=d*y
      v2=(c6+(c8+c10*x2)*x2)*x2**3
      v2p=-(6.*c6+(8.*c8+10.*c10*x2)*x2)*x2**3/r
      v2pp=(6.*7.*c6+(8.*9.*c8+10.*11.*c10*x2)*x2)*x2**3/r**2
      if (dy.gt.1.) then
         f=f*exp(-min(expmax,(dy-1.)**2))
         fp=2.*(dy-1.)*dy*f/r
         endif
      v=v1-f*v2
      vp=v1p-f*v2p-fp*v2
      vpp=v1pp-f*v2pp-2.*fp*v2p
      return
      end
