package appwebtfg

class Course {

    String name
    String description
    float avgscore
    int studentNumber

    static constraints = {
        name nullable: false, blank: false
        description nullable: true, blank: true
    }
}
