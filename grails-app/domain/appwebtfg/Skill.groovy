package appwebtfg

class Skill {
    String name
    String level
    static constraints = {
        name nullable: false, blank: false
        level matches: /basic||medium||expert/
    }
}
