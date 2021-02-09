package appwebtfg

class Course {

    String name
    String description
    Float avgscore
    Integer studentNumber

    static constraints = {
        name nullable: false, blank: false
        description nullable: true, blank: true
        avgscore nullable: true, blank: true
        studentNumber nullable: true, blank: true
    }
}
