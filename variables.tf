variable "resource-group-name"{
    default = "new-terraform-ci-cd"
    description = "This is my project Resource Group"
}

variable "location"{
    default = "North Central US"
    description = "This is my project Resource Group location"
}

variable "prefix" {
    default = "terraform-project"
    description = "This is my project resource prefix"
}