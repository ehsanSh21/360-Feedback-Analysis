# 360-Feedback-Analysis
360-Degree Feedback Analysis with MySQL

### Project Overview:
The 360 degree feedback result project aimed to analyze feedback collected from participants within the organization. By aggregating and analyzing the feedback, the project provided insights into individual performance, identifying strengths and areas for improvement. The project utilized a relational database to store the feedback data and employed SQL queries to calculate metrics and results. Overall, the project showcased a strong understanding of data analysis, database management, and the ability to derive meaningful insights from complex datasets.


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


