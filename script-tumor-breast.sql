SELECT COUNT(*) FROM cap03.TB_DADOS;

# Binarization of the class variable (0/1)
SELECT DISTINCT classe FROM cap03.TB_DADOS;

SELECT 
	CASE 
	WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe
FROM cap03.TB_DADOS;

# Binarization of the radiating variable (0/1)
SELECT DISTINCT irradiando FROM cap03.TB_DADOS;

SELECT 
	CASE 
	WHEN irradiat = 'no' THEN 0 
        WHEN irradiat = 'yes' THEN 1
	END as irradiat
FROM cap03.TB_DADOS;

# Binarization of the node_caps variable (0/1)
SELECT DISTINCT node_caps FROM cap03.TB_DADOS;

SELECT 
	CASE 
	WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
	END as node_caps
FROM cap03.TB_DADOS;


# To adjust the node_caps variable we will now encode the variable and no longer binarize
SELECT 
	CASE 
	WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps
FROM cap03.TB_DADOS;

# Categorization of the breast variable (E/D)
SELECT DISTINCT seio FROM cap03.TB_DADOS;

SELECT 
	CASE 
	WHEN breast = 'left' THEN 'E' 
        WHEN breast = 'right' THEN 'D'
	END as breast
FROM cap03.TB_DADOS;

# Categorization of the tumor_size variable (6 Categories)
SELECT DISTINCT tumor_size FROM cap03.TB_DADOS;

SELECT 
	CASE 
	WHEN tumor_size = '0-4' OR tumor_size = '5-9' THEN 'very small'
        WHEN tumor_size = '10-14' OR tumor_size = '15-19' THEN small
        WHEN tumor_size = '20-24' OR tumor_size = '25-29' THEN medium
        WHEN tumor_size = '30-34' OR tumor_size = '35-39' THEN big
        WHEN tumor_size = '40-44' OR tumor_size = '45-49' THEN 'very big'
        WHEN tumor_size = '50-54' OR tumor_size = '55-59' THEN 'Urgent Treatment'
	END as tumor_size
FROM cap03.TB_DADOS;

#categorization of the chest quadrant variable (1,2,3,4,5), an empty value was found, it was replaced by 0
SELECT DISTINCT breast_quad FROM cap03.tb_dados

SELECT 
	CASE
		WHEN breast_quad = 'left_low' THEN '1'
        	WHEN breast_quad = 'right_up' THEN '2'
        	WHEN breast_quad = 'left_up' THEN '3'
        	WHEN breast_quad = 'right_low' THEN '4'
        	WHEN breast_quad = 'central' THEN '5'
        	ELSE 0
	END as breast_quad
FROM cap03.tb_dados

# Query with all transformations
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        	WHEN classe = 'recurrence-events' THEN 1
	END as class,
	age
	menopause,
	CASE 
		WHEN tumor_size = '0-4' OR tumor_size = '5-9' THEN 'very small'
        	WHEN tumor_size = '10-14' OR tumor_size = '15-19' THEN 'small'
       	 	WHEN tumor_size = '20-24' OR tumor_size = '25-29' THEN 'medium'
        	WHEN tumor_size = '30-34' OR tumor_size = '35-39' THEN 'big'
        	WHEN tumor_size = '40-44' OR tumor_size = '45-49' THEN 'very big'
        	WHEN tumor_size = '50-54' OR tumor_size = '55-59' THEN 'urgent treatment'
	END as tumor_size,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        	WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN breast = 'left' THEN 'E' 
        	WHEN breast = 'right' THEN 'D'
	END as breast,
	CASE 
		WHEN breast_quad = 'left_low' THEN '1'
        	WHEN breast_quad = 'right_up' THEN '2'
        	WHEN breast_quad = 'left_up' THEN '3'
        	WHEN breast_quad = 'right_low' THEN '4'
        	WHEN breast_quad = 'central' THEN '5'
        	ELSE 0
	END as breast_quad,
	CASE 
		WHEN irradiat = 'no' THEN 0 
        	WHEN irradiat = 'yes' THEN 1
	END as irradiat
FROM cap03.TB_DADOS;

# Create a new table
CREATE TABLE cap03.TB_DADOS2
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        	WHEN classe = 'recurrence-events' THEN 1
	END as class,
	age
	menopause,
	CASE 
		WHEN tumor_size = '0-4' OR tumor_size = '5-9' THEN 'very small'
        	WHEN tumor_size = '10-14' OR tumor_size = '15-19' THEN 'small'
       	 	WHEN tumor_size = '20-24' OR tumor_size = '25-29' THEN 'medium'
        	WHEN tumor_size = '30-34' OR tumor_size = '35-39' THEN 'big'
        	WHEN tumor_size = '40-44' OR tumor_size = '45-49' THEN 'very big'
        	WHEN tumor_size = '50-54' OR tumor_size = '55-59' THEN 'urgent treatment'
	END as tumor_size,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        	WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN breast = 'left' THEN 'E' 
        	WHEN breast = 'right' THEN 'D'
	END as breast,
	CASE 
		WHEN breast_quad = 'left_low' THEN '1'
        	WHEN breast_quad = 'right_up' THEN '2'
        	WHEN breast_quad = 'left_up' THEN '3'
        	WHEN breast_quad = 'right_low' THEN '4'
        	WHEN breast_quad = 'central' THEN '5'
        	ELSE 0
	END as breast_quad,
	CASE 
		WHEN irradiat = 'no' THEN 0 
        	WHEN irradiat = 'yes' THEN 1
	END as irradiat
FROM cap03.TB_DADOS;


SELECT COUNT(*) FROM cap03.TB_DADOS2;




