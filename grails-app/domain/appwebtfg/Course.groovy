package appwebtfg

class Course {

    String title
    String description
    String url
    String category
    Integer duration
    Long idCurso
    String language
    String author
    Integer popularity
    Float rating
    String difficulty
    /*
    isFree can be:
    - 0 if the course is NOT free
    - 1 if the course is free
    - 2 if the course is from Coursera (The course is free but you must pay for the certificate)
    - 3 if the course is from Udacity (You must pay a monthly subscription fee of 359€)
     */
    int isFree
    Float price

    static mapping = {
        description type: 'text'
    }

    static constraints = {
        title nullable: false, blank: false
        description nullable: true, blank: true
        rating nullable: true, blank: true
        url nullable: true, blank: true
        category nullable: true, blank: true
        duration nullable: true, blank: true
        idCurso nullable: true, blank: true
        language nullable: true, blank: true
        author nullable: true, blank: true
        popularity nullable: true, blank: true
        difficulty nullable: true, blank: true
        price nullable: true, blank: true

    }
}
