classdef Country <handle
    properties (Access=private)
        StateList,
        StateNumber,
        CountryName,
        StatesName
    end
    
    methods
        function obj=Country()
            obj.StateList=[];
            obj.StateNumber=0;
            obj.CountryName='';
            obj.StatesName=[];
        end
        function countryName=getName(obj)
            countryName= obj.CountryName;
        end
        function sName=getStatesName(obj)
            sName= obj.StatesName;
        end
        function sNum=getStateNumber(obj)
            sNum =obj.StateNumber;
        end
        function sList=getStateList(obj)
            sList=obj.StateList;
        end
        function insertStateName(obj,sName)
            obj.StatesName=[obj.StatesName sName];
        end
        function setCountryName(obj,cName)
            obj.CountryName=cName; 
        end
        function insertState(obj,state)
            % Insert into state vector
            obj.StateList=[obj.StateList state];
            % Count by one
            obj.StateNumber = obj.StateNumber +1;
            
            % Get state name
            name = state.getName;
            
            obj.insertStateName(name)
        end
        
        function populateStates(obj,name,cumData,date)
            
            % Convert cell to vector array for cumulative case
            cumCase=cellfun(@(v)v(1),cumData);
            
            % Convert cell to vector array for death case
            cumDeath=cellfun(@(v)v(2),cumData);
            
            % Calculate daily case
            dCase=obj.takeDerivative(cumCase);
            
            % Calculate daily death
            dDeath=obj.takeDerivative(cumDeath);
            
            % Create state object
            sObj=State(name,cumCase,cumDeath,date,dDeath,dCase);
            
            % Insert the vector of state object
            obj.insertState(sObj);
            
        end
        function out=takeDerivative(obj,in)
            % Get ready to derivative operation
            in = [0 in];
            
            % Take derivative
            out=diff(in);
            
            % Outlier analaysis
            eIndx =find(out<0);
            if ~isempty(eIndx)
              % fprintf("There is erroneous sample in database !!\n"); 
            end
            % Fix them just assign zero these sample
            out(eIndx)=0;
            
        end
        function disp(obj)
           obj.CountryName
           obj.StateList
           obj.StateNumber
           obj.StatesName
        end
    end
    
    
    
end