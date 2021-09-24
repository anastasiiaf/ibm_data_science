--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE ( 
    IN in_School_ID INTEGER, IN in_Leader_Score INTEGER )     -- ( { IN/OUT type } { parameter-name } { data-type }, ... )

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

    
BEGIN 

    
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN                           
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET leaders_score = in_Leader_Score, leaders_icon = 'Very weak'
        WHERE school_id = in_School_ID;
    
	ELSEIF in_Leader_Score < 40 THEN                          
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET leaders_score = in_Leader_Score, leaders_icon = 'Weak'
        WHERE school_id = in_School_ID;
        
    ELSEIF in_Leader_Score < 60 THEN                           
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET leaders_score = in_Leader_Score, leaders_icon = 'Average'
        WHERE school_id = in_School_ID;
        
    ELSEIF in_Leader_Score < 80 THEN                           
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET leaders_score = in_Leader_Score, leaders_icon = 'Strong'
        WHERE school_id = in_School_ID;
        
    ELSEIF in_Leader_Score < 100 THEN                           
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET leaders_score = in_Leader_Score, leaders_icon = 'Very strong'
        WHERE school_id = in_School_ID;
    
    ELSE                                 
            ROLLBACK WORK;
        
    
    END IF;                                                 
    		COMMIT WORK;
END
@                                                           -- Routine termination character