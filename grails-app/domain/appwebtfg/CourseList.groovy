package appwebtfg

class CourseList {

    String name
    String description
    static belongsTo = [owner: User]
    static hasMany = [courses: Course]

    static constraints = {
        name nullable: false, blank: false
        description nullable: true, blank: true
        owner nullable: false, blank: false
    }
}
