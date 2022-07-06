# Media Data

This repository is a large dataset of records for testing against 
the [vtmedia-schema](https://github.com/cjcodeproj/vtmedia-schema) project and the 
[medialibrary](https://github.com/cjcodeproj/medialibrary) project.  It is available for test cases 
where a larger sample of data may be required, or for importing data to other 
systems, or it could be used as reference material for anyone looking to use the 
schema to catalog their own media library.

Everything here is licensed under Creative Commons.


# Getting started

Using the data just requires cloning this repository.  
Depending on what you want to do with the data, you may want to clone one or both of 
the other repositories listed below.

| Repository | Purpose |
| --- | --- |
| [vtmedia-schema](https://github.com/cjcodeproj/vtmedia-schema) | Validation of data using XML tools |
| [medialibrary](https://github.com/cjcodeproj/medialibrary) | Examination of data using Python code |

Both repositories include README.md files that cover installation and management of the files.

Downloading the schema will let you use tools like xmllint, xmlstarlet, VS Code, or any other 
tool that can work with XMLSchema.

Downloading the Python code will pull in the data and organize it into data structures.  If you don't intend to 
modify the Python code base, just install it as a module into your local module path.


# Validation testing code

The `bin` directory includes one program for testing the XML files.  If you download the XML Schema, you 
should change the `XPATH` variable to point to the location of the schema files.

# Examination code

If you download the Python code repository, you can reference the location of the dataset by 
defining an environmental variable called `MEDIAPATH`.  All the tools include command line
help information.

# Contributing

Contributions for corrections to existing data will be accepted.  New title submissions will not
be accepted.

If you want to generate new data for a given film, it should go in your own fork.

Future updates will be posted to this repository, but there is no set schedule.  New titles 
will be added in batches, under a separate branch, and then merged by a pull request.

