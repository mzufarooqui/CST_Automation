function x = f_CallOptimizationAlgo(hObjectiveFunc,x0,LowerB,UpperB,optAlgorithm,VfreqSpecAnal)

global Vfreq 
global PhaseGoal SogliaS11VpoldB SogliaS11HpoldB SogliaCrossCoRatiodB SogliaIsoldB% valori di specifica
global LSQNONLIN_ALGO FMINIMAX_ALGO FGOALATTAIN_ALGO FMINCON_ALGO GAMULTIOBJ_ALGO GLOBAL_SEARCH MULTI_START MULTI_START_PARALLEL
options = [];
switch optAlgorithm
    case LSQNONLIN_ALGO
        options = optimset('lsqnonlin');
        options = optimset(options,'DiffMinChange',1e-3,'LargeScale','on','TolFun',1e-10,'GradObj','off','Display', 'iter');
        x = lsqnonlin(hObjectiveFunc,x0,LowerB,UpperB,options);
    case FMINIMAX_ALGO        
        options = optimset('fminimax');
        options = optimset(options,'DiffMinChange',1e-3,'TolFun',1e-10,'GradObj','off','Display', 'iter');
        x=fminimax(hObjectiveFunc,x0,[],[],[],[],LowerB,UpperB,[],options);
    case FGOALATTAIN_ALGO
        I                  = find( Vfreq >= VfreqSpecAnal(1) & Vfreq <= VfreqSpecAnal(end));
        numOfPoints        = length(I);
        desS11VpoldB       = repmat(SogliaS11VpoldB , 1 , numOfPoints);
        desS11HpoldB       = repmat(SogliaS11HpoldB , 1 , numOfPoints);
        desCrossCoRationdB = repmat(SogliaCrossCoRatiodB , 1 , numOfPoints );
        desIsoldB          = repmat(SogliaIsoldB , 1 , numOfPoints );
        goal               = [ desS11VpoldB desS11HpoldB desCrossCoRationdB desIsoldB ];
        weight             = abs( [ desS11VpoldB desS11HpoldB desCrossCoRationdB desIsoldB ] );
        options = optimset('fgoalattain');
        options = optimset(options,'DiffMinChange',1e-3,'LargeScale','off','TolFun',1e-10,'GradObj','off');
        x = fgoalattain( hObjectiveFunc , x0 , goal , weight , [] , [] , [] , [] , LowerB , UpperB , [] , options );
    case FMINCON_ALGO
        options = optimset('fmincon');
        options = optimset(options,'DiffMinChange',1e-3,'LargeScale','on','TolFun',1e-10,'GradObj','off','Algorithm','sqp'); %'trust-region-reflective' (default),'active-set','interior-point','sqp'
        x=fmincon(hObjectiveFunc,x0,[],[],[],[],LowerB,UpperB,[],options);
    case GAMULTIOBJ_ALGO
        options = optimset('gamultiobj');
        options = optimset(options,'DiffMinChange',1e-3,'LargeScale','on','TolFun',1e-10,'GradObj','off');
        x=gamultiobj(hObjectiveFunc,length(x0),[],[],[],[],LowerB,UpperB,options);
    case GLOBAL_SEARCH
        opts = optimset(options,'DiffMinChange',1e-3,'LargeScale','on','TolFun',1e-10,'GradObj','off');
        problem = createOptimProblem('fmincon','objective',...
            hObjectiveFunc,'x0',x0,'lb',LowerB,'ub',UpperB,'options',opts);
        gs = GlobalSearch('Display','iter');
        [x,f] = run(gs,problem);
    case MULTI_START
        opts = optimset('Algorithm','interior-point','DiffMinChange',1e-10);
        problem = createOptimProblem('fmincon','objective',...
            hObjectiveFunc,'x0',x0,'lb',LowerB,'ub',UpperB,'options',opts);
        ms = MultiStart('UseParallel', 'always','Display','iter');
        [x,f] = run(ms,problem,3);
    case MULTI_START_PARALLEL
        matlabpool open 3
        opts = optimset('Algorithm','interior-point','DiffMinChange',1e-3);
        problem = createOptimProblem('fmincon','objective',...
            hObjectiveFunc,'x0',x0,'lb',LowerB,'ub',UpperB,'options',opts);
        ms = MultiStart('UseParallel', 'always');
        [x,f] = run(ms,problem,3);
        matlabpool close
end
end