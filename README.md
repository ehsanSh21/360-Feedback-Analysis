# 360-Feedback-Analysis
360-Degree Feedback Analysis with MySQL

## Table of Contents

- [Project Overview](#project-overview)
- [Data Description](#data-description)
- [SQL Queries](#sql-queries)


<a name="project-overview"></a>
### Project Overview:
The 360 degree feedback result project aimed to analyze feedback collected from participants within the organization. By aggregating and analyzing the feedback, the project provided insights into individual performance, identifying strengths and areas for improvement. The project utilized a relational database to store the feedback data and employed SQL queries to calculate metrics and results. Overall, the project showcased a strong understanding of data analysis, database management, and the ability to derive meaningful insights from complex datasets.

<a name="data-description"></a>
### Data Description:
The project utilized a relational database to store the feedback data. The database consisted of several tables, including the "users" table for storing information about the individuals, the "forms" table for defining the evaluation forms, the "form_groups" table for grouping related form elements, the "form_elements" table for capturing the specific evaluation criteria, and the "answers" table for storing the feedback responses.

The tables were designed with appropriate relationships and foreign key constraints to ensure data integrity and efficient querying. The "users" table contained essential details such as user IDs, names, departments, and roles. The "forms" table defined the evaluation forms with their respective attributes. The "form_groups" and "form_elements" tables helped organize and categorize the evaluation criteria. The "answers" table stored the feedback responses, linking them to the corresponding users, forms, and form elements.

#### Table: users

```json
{
  "Table": "users",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key", "Auto Increment"]
    },
    {
      "name": "name",
      "type": "VARCHAR(255)",
      "constraints": ["Not Null"]
    },
    {
      "name": "email",
      "type": "VARCHAR(255)",
      "constraints": ["Not Null"]
    },
    {
      "name": "mobile_prefix",
      "type": "VARCHAR(10)"
    },
    {
      "name": "mobile",
      "type": "VARCHAR(20)"
    },
    {
      "name": "email_verified_at",
      "type": "TIMESTAMP"
    },
    {
      "name": "mobile_verified_at",
      "type": "TIMESTAMP"
    },
    {
      "name": "created_at",
      "type": "TIMESTAMP",
      "constraints": ["Default: Current Timestamp"]
    },
    {
      "name": "updated_at",
      "type": "TIMESTAMP",
      "constraints": ["Default: Current Timestamp", "On Update: Current Timestamp"]
    }
  ]
}
```

#### Table: forms

```json
{
  "Table": "forms",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "uuid",
      "type": "VARCHAR(36)",
      "constraints": ["Unique"]
    },
    {
      "name": "type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "course_id",
      "type": "Integer"
    },
    {
      "name": "user_id",
      "type": "Integer",
      "foreign_key": {
        "references": "users(id)"
      }
    },
    {
      "name": "created_at",
      "type": "DATETIME"
    },
    {
      "name": "updated_at",
      "type": "DATETIME"
    }
  ]
}
```

sample data:

id | uuid                                 | type       | course_id | user_id | created_at           | updated_at           |
---|--------------------------------------|------------|-----------|---------|----------------------|----------------------|
12 | 0b59cb43-2496-45cb-9b66-b5ce62be3fc1 | assessment | NULL      | 1       | 2023-09-28 06:37:06  | 2023-09-28 06:37:06  |


#### Table: form_groups
```json
{
  "Table": "form_groups",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "form_id",
      "type": "Integer",
      "foreign_key": {
        "references": "forms(id)"
      }
    },
    {
      "name": "data",
      "type": "JSON"
    },
    {
      "name": "created_at",
      "type": "DATETIME"
    },
    {
      "name": "updated_at",
      "type": "DATETIME"
    }
  ]
}
```
sample data:
id | form_id | data                | created_at           | updated_at           |
---|---------|---------------------|----------------------|----------------------|
23 | 12      | '{"column":"4"}'    | 2023-09-28 06:37:06  | 2023-09-28 06:37:06  |


#### Table: form_elements

```json
{
  "Table": "form_elements",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "uuid",
      "type": "VARCHAR(36)",
      "constraints": ["Unique"]
    },
    {
      "name": "form_id",
      "type": "Integer",
      "foreign_key": {
        "references": "forms(id)"
      }
    },
    {
      "name": "group_id",
      "type": "Integer",
      "foreign_key": {
        "references": "form_groups(id)"
      }
    },
    {
      "name": "type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "ordering",
      "type": "Integer"
    },
    {
      "name": "created_at",
      "type": "DATETIME"
    },
    {
      "name": "updated_at",
      "type": "DATETIME"
    }
  ]
}
```
sample data: 
id | uuid                                 | form_id | group_id | type   | ordering | created_at           | updated_at           |
---|--------------------------------------|---------|----------|--------|----------|----------------------|----------------------|
64 | 46e8b340-50c9-4a6e-9832-e9081bdcd44d | 12      | 23       | radio  | 3        | 2023-09-28 06:37:06  | 2023-09-28 06:37:06  |
65 | de9f7e22-6798-4755-b21c-7d81eba36664 | 12      | 23       | radio  | 2        | 2023-09-28 06:37:06  | 2023-09-28 06:37:06  |


#### Table: metas

```json
{
  "Table": "metas",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "relatable_type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "relatable_id",
      "type": "Integer"
    },
    {
      "name": "key",
      "type": "VARCHAR(255)"
    },
    {
      "name": "value",
      "type": "VARCHAR(255)"
    },
    {
      "name": "is_json",
      "type": "CHAR(1)"
    }
  ]
}
```
sample data: 
id  | relatable_type          | relatable_id | key              | value  | is_json |
----|-------------------------|--------------|------------------|--------|---------|
335 | AppModelsFormElement    | 64           | ratio            | 4      | f       |
625 | AppModelsFormGroup      | 23           | ratio            | 6      | f       |
748 | AppModelsFormElement    | 64           | reverse_grading  | true   | f       |


#### Table: relationships

```json
{
  "Table": "relationships",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "from_type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "from_id",
      "type": "Integer"
    },
    {
      "name": "to_type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "to_id",
      "type": "Integer"
    }
  ]
}
```
sample data:
id | from_type          | from_id | to_type              | to_id |
---|--------------------|---------|----------------------|-------|
5  | AppModelsForm      | 12      | AppModelsDepartment  | 1     |
6  | AppModelsForm      | 12      | AppModelsDepartment  | 2     |


#### Table: members

```json
{
  "Table": "members",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "memberable_type",
      "type": "VARCHAR(255)"
    },
    {
      "name": "memberable_id",
      "type": "Integer"
    },
    {
      "name": "user_id",
      "type": "Integer",
      "constraints": ["Foreign Key: users(id)"]
    },
    {
      "name": "deleted_at",
      "type": "TIMESTAMP"
    },
    {
      "name": "created_at",
      "type": "TIMESTAMP"
    },
    {
      "name": "updated_at",
      "type": "TIMESTAMP"
    }
  ]
}
```
sample data: 
id | memberable_type      | memberable_id | user_id | deleted_at           | created_at           | updated_at           |
---|----------------------|---------------|---------|----------------------|----------------------|----------------------|
3  | AppModelsDepartment  | 2             | 5       | 2023-10-26 07:45:45  | 2023-10-26 07:45:45  | 2023-10-26 07:45:45  |
4  | AppModelsDepartment  | 1             | 1       | 2023-10-26 07:45:45  | 2023-10-26 07:45:45  | 2023-10-26 07:45:45  |

#### Table: answers

```json
{
  "Table": "answers",
  "Columns": [
    {
      "name": "id",
      "type": "Integer",
      "constraints": ["Primary Key"]
    },
    {
      "name": "uuid",
      "type": "VARCHAR(255)"
    },
    {
      "name": "user_id",
      "type": "Integer",
      "constraints": ["Foreign Key: users(id)"]
    },
    {
      "name": "form_element_id",
      "type": "Integer",
      "constraints": ["Foreign Key: form_elements(id)"]
    },
    {
      "name": "answer",
      "type": "VARCHAR(255)"
    },
    {
      "name": "evaluated_user_id",
      "type": "Integer",
      "constraints": ["Foreign Key: users(id)"]
    },
    {
      "name": "created_at",
      "type": "TIMESTAMP"
    },
    {
      "name": "updated_at",
      "type": "TIMESTAMP"
    }
  ]
}
```
sample data: 
id | uuid                                 | user_id | form_element_id | answer | evaluated_user_id | created_at           | updated_at           |
---|--------------------------------------|---------|-----------------|--------|-------------------|----------------------|----------------------|
75 | 587aeff1-ddef-4b7a-9dde-ddf65f2e143e | 4       | 65              | 5      | 5                 | 2023-10-03 10:59:42  | 2023-10-03 10:59:42  |
66 | 0b3cdc3c-651a-498d-86f4-f32d44026d10 | 1       | 66              | 2      | 2                 | 2023-09-28 07:47:10  | 2023-10-01 12:24:42  |
73 | 9b00b7cb-c0b9-4e8b-b5fd-19b02387aa26 | 3       | 66              | 5      | 2                 | 2023-09-28 10:54:36  | 2023-09-28 10:54:36  |
92 | 7e9a8509-ccb6-4252-9453-5f208553e9b0 | 1       | 65              | 5      | 1                 | 2023-10-09 09:08:51  | 2023-10-09 09:08:51  |
93 | 85dd8eb4-0aec-4cc7-b786-bc014bd0eea5 | 1       | 66              | 1      | 1                 | 2023-10-09 09:09:47  | 2023-10-09 09:09:47  |

<a name="sql-queries"></a>
### SQL Queries:

#### overall point for a specific element:
  This query calculates the overall point for a specific user in relation to a specific element in a form. The range of rating considered is from 1 to 5. The query takes into account reverse grading if the corresponding meta value for the element is set to 'true' for reverse grading.

  ```sql
SELECT 
    form_elements.*,
    (CASE WHEN metas_reverse.`key` = 'reverse_grading' THEN (5) - (AVG(CAST(answers.answer AS DECIMAL))) + 1 ELSE (SUM(CAST(answers.answer AS DECIMAL)) / COUNT(*)) END) AS overall_point
FROM form_elements
JOIN answers ON form_elements.id = answers.form_element_id
    AND answers.evaluated_user_id = 2
JOIN metas ON form_elements.id = metas.relatable_id
    AND metas.relatable_type = 'AppModelsFormElement'
    AND metas.`key` = 'ratio'
LEFT JOIN metas AS metas_reverse ON form_elements.id = metas_reverse.relatable_id
    AND metas_reverse.relatable_type = 'AppModelsFormElement'
    AND metas_reverse.`key` = 'reverse_grading'
    AND metas_reverse.`value` = 'true'
WHERE form_elements.id = 64
GROUP BY 
    form_elements.id,
    answers.evaluated_user_id,
    metas_reverse.`key`;
```

#### percent rank for a specific element:
This query calculates the overall point and percent rank for a specific user in relation to a specific element in a form.

```sql
SELECT 
    form_elements.*,
    answers.evaluated_user_id,
    (CASE WHEN metas_reverse.`key` = 'reverse_grading' THEN (5) - (AVG(CAST(answers.answer AS DECIMAL))) + 1 ELSE (SUM(CAST(answers.answer AS DECIMAL)) / COUNT(*)) END) AS overall_point,
    CASE
    WHEN metas_reverse.key = 'reverse_grading' THEN
        (PERCENT_RANK() OVER (ORDER BY ((5) - (AVG(answers.answer)) + 1) * 100))
    ELSE
        (PERCENT_RANK() OVER (ORDER BY (SUM(answers.answer) / COUNT(*)))) * 100
END AS PercentRank
FROM
    form_elements
JOIN
    answers ON form_elements.id = answers.form_element_id
JOIN
    metas ON form_elements.id = metas.relatable_id
    
    LEFT JOIN metas AS metas_reverse ON form_elements.id = metas_reverse.relatable_id
    AND metas_reverse.relatable_type = 'AppModelsFormElement'
    AND metas_reverse.`key` = 'reverse_grading'
    AND metas_reverse.`value` = 'true'
WHERE
    metas.relatable_type = 'AppModelsFormElement'
    AND metas.key = 'ratio'
    AND form_elements.id = 64
GROUP BY
    form_elements.id,
    answers.evaluated_user_id;
```

#### overall point for a specific group:
This SQL query utilizes a subquery to calculate the overall point for a group of elements, considering their individual ratios and reverse grading settings. The subquery performs intricate calculations, taking into account the metas values for each element. The outer query then computes the total_sum_result for the group based on the subquery results.

```sql
SELECT 
    subquery.group_id,
    SUM(subquery.sum_result) / SUM(subquery.ratios) AS total_sum_result
FROM
    (SELECT 
        form_groups.id AS group_id,
        form_elements.id,
        (CASE 
            WHEN metas_reverse.key = 'reverse_grading' THEN ((5) - (AVG(answers.answer)) + 1) * (SELECT metas.value FROM metas WHERE metas.relatable_id = form_elements.id AND metas.relatable_type = 'AppModelsFormElement' AND metas.key = 'ratio')
            ELSE (SUM(answers.answer) / COUNT(*)) * (SELECT metas.value FROM metas WHERE metas.relatable_id = form_elements.id AND metas.relatable_type = 'AppModelsFormElement' AND metas.key = 'ratio')
        END) AS sum_result,
        (CASE 
            WHEN metas_reverse.key = 'reverse_grading' THEN (SELECT metas.value FROM metas WHERE metas.relatable_id = form_elements.id AND metas.relatable_type = 'AppModelsFormElement' AND metas.key = 'ratio')
            ELSE (SELECT metas.value FROM metas WHERE metas.relatable_id = form_elements.id AND metas.relatable_type = 'AppModelsFormElement' AND metas.key = 'ratio')
        END) AS ratios
    FROM 
        form_groups
    JOIN 
        form_elements ON form_groups.id = form_elements.group_id
    JOIN 
        answers ON form_elements.id = answers.form_element_id
    JOIN 
        metas ON form_elements.id = metas.relatable_id AND metas.relatable_type = 'AppModelsFormElement' AND metas.key = 'ratio'
    LEFT JOIN 
        metas AS metas_reverse ON form_elements.id = metas_reverse.relatable_id AND metas_reverse.relatable_type = 'AppModelsFormElement' AND metas_reverse.key = 'reverse_grading' AND metas_reverse.value = 'true'
    WHERE 
        answers.evaluated_user_id = 2
        AND form_groups.id = 23
    GROUP BY 
        form_groups.id,
        metas_reverse.key,
        form_elements.id) AS subquery
GROUP BY 
    subquery.group_id;
```

#### participation percentage:
This query calculates the participation percentage of individuals in a department who answered a specific form assigned to their department.

```sql
SELECT 
    COUNT(DISTINCT members.user_id) AS member_count,
    COUNT(DISTINCT member_dep.user_id) AS departmet_members_count,
    (COUNT(DISTINCT members.user_id) * 100) / NULLIF(COUNT(DISTINCT member_dep.user_id), 0) AS Participation_percentage
FROM forms
JOIN form_elements ON forms.id = form_elements.form_id
JOIN answers ON form_elements.id = answers.form_element_id
LEFT JOIN relationships ON forms.id = relationships.from_id AND relationships.from_type = 'AppModelsForm' AND relationships.to_id = 2 AND relationships.to_type = 'AppModelsDepartment'
LEFT JOIN members AS member_dep ON relationships.to_id = member_dep.memberable_id AND member_dep.memberable_type = 'AppModelsDepartment'
LEFT JOIN members ON answers.evaluated_user_id = members.user_id AND members.memberable_type = 'AppModelsDepartment' AND members.memberable_id = 2
WHERE forms.id = 12 AND answers.evaluated_user_id IS NOT NULL
GROUP BY forms.id;
```

### Database Schema:


![alt text](https://github.com/ehsanSh21/360-Feedback-Analysis/blob/main/360_degree_feedback.svg)










