classdef State<handle
    
    properties (Access=private)
        Name,
        CumulativeCase,
        CumulativeDeath
        DailyCase
        DailyDeath
        Date
        
    end
    
    methods
        function obj=State(sName,cumDeath,cumCase,date,dDeath,dCase)
            if nargin <6,dCase=0;end
            if nargin <5,dDeath=0;end
            if nargin <4,date=0; end 
            if nargin <3, cumCase=0; end
            if nargin <2, cumDeath=0; end
            if nargin <1 || isempty(sName), sName='All'; end
            
            
            obj.Name = string(sName);
            obj.CumulativeCase=cumDeath;
            obj.CumulativeDeath=cumCase;
            obj.Date=date;
            obj.DailyDeath=dDeath;
            obj.DailyCase=dCase;
        end
        function name=getName(obj)
            name=obj.Name;
        end
        function cumDeath=getCumulativeDeath(obj)
           cumDeath=obj.CumulativeDeath; 
        end
        function cumCase=getCumulativeCase(obj)
            cumCase=obj.CumulativeCase;
        end
        function date=getDate(obj)
            date = obj.Date;
        end
        function dCase=getDailyCase(obj)
            dCase = obj.DailyCase;
        end
        function dDeath = getDailyDeath(obj)
           dDeath = obj.DailyDeath; 
        end
        
        function disp(obj)
           fprintf("State Name:\n");
           obj.Name
           fprintf("Cumulative Death:\n")
           obj.CumulativeCase
           fprintf("Cumulative Case: ");
           obj.CumulativeDeath
           fprintf("Date: ");
           obj.Date
        end
            
    end

    
    
    
end
