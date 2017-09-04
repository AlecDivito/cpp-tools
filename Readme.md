# Alec's Basic C++ Tools

The purpose of this project is to provide a basic set of tools that can help create and manage a C++ project in the linux enviroment.
The project is ongoing and will grow slowly as my requirements for my tools increase.

## Getting Started

clone the repository into your bin folder. If your bin folder is not in the global paths variable then run
```
PATH=$PATH:~/path/to/bin
```
where "~/path/to/bin" is the path to your bin folder

### Creating a new project

```
cpp_project_init.sh "nameOfProject"
```
For right now there are no options

### Adding a new class to the project

Add a class
```
cpp_class.sh "class"
```
OR
```
cpp_class.sh "/path/to/class"
```
Add a class to a spesific directory. You must start with a '/'. 
For right now there are no options

### Removing class from project
```
cpp_remove_class.sh "class"
```
Remove class from from project. Place into trash folder. Trash folder is where you stored this script.
