      subroutine tail(etail)
      implicit real*8 (A-H,O-Z)
      parameter (ndim=3)
      common /const/ pi,hb,hbo4m,delta,deltai,delts,deltsi,sd,
     +               el2,el,eli,vkey,bkeyu,bkey,bins,np,np2
      save c6,c8,c10,sigma,rm,eps
      data c6,c8,c10,sigma,rm,eps
     +     /1.3732412,.4253785,.1781,2.556,2.9673,10.8/
      rho=np/(2.*el2)**ndim
      yfit=rm/(sigma*el2)
      x2=yfit*yfit
      if (ndim.eq.2) then
         vint=(c6/4.+(c8/6.+c10*x2/8.)*x2)*x2*x2
         etail=-pi*rho*eps*vint*(rm/sigma)**2
      elseif (ndim.eq.3) then
         vint=(c6/3.+(c8/5.+c10*x2/7.)*x2)*x2*yfit
         etail=-2.*pi*rho*eps*vint*(rm/sigma)**3
      endif
      return
      end
