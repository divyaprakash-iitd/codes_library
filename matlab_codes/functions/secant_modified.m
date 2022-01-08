function [r,n] = secant_modified(f,r,c,tol)
    max_itr = 1e6;
    n=0;
    for i=0:100
        p=r+(c*r);
        fp=f(p);
        fr=f(r);
        pprime=(fp-fr)/(c*r);
        t=r;
        r=p-(fp/pprime);
        g=(abs(r-t)/abs(r))*100;
        n=n+1;
        if (g<=tol)||(n==max_itr) 
            break;
        end
    end
end
