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

