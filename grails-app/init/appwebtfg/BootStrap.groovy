package appwebtfg

import com.opencsv.CSVReader
import grails.gorm.transactions.Transactional

class BootStrap {

    def init = { servletContext ->
        addTestUser()
        readCsv()
    }

    @Transactional
    void readCsv(){
        try {
            CSVReader reader = new CSVReader(new FileReader("./grails-app/init/appwebtfg/cleaned_coursera.csv"))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.eachWithIndex{ String[] line, int index ->
                Course course = new Course(title: line[14], description: line[1],url: line[15],category: mapCourseraCategory(line[17]),idCurso: index,language: line[9],author: line[7],rating: Float.parseFloat(line[11]),difficulty: line[2])
                if(course)
                    course.save()
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace()
        } catch (IOException e) {
            e.printStackTrace()
        }
    }

    String mapCourseraCategory(String ogCategory) {
        return "none"
    }

    @Transactional
    void addTestUser() {
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def testUser = new User(username: 'me', password: 'password', email: 'email@gmail.com')
        CourseList cl1 = new CourseList(name: "To Do", owner: testUser)
        testUser.addToLists(cl1)
        testUser.save()

        UserRole.create testUser, adminRole
        UserRole.create(testUser,userRole)
        UserRole.withSession {
            it.flush()
            it.clear()
        }

        Course c1 = new Course(title: "testCourse").save()
        Course c2 = new Course(title: "nombre", rating: 3.4, description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgthytjuryikjdhtsgvfdascaxnhtmjyk,tu,kgumfjhgdnfsbdvfscdk,umfjyhgdnfbvdfc").save()
        Course c3 = new Course(title: "nombre", description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgt").save()
        cl1.addToCourses(c1)
        cl1.addToCourses(c2)
        cl1.addToCourses(c3)
        cl1.save()

        //Basic Skills
        for(int i=0;i<10;i++)
            new Skill(name:"JS",level: "basic").save()
        for(int i=0;i<7;i++)
            new Skill(name:"C++",level: "basic").save()
        for(int i=0;i<5;i++)
            new Skill(name:"SQL",level: "basic").save()
        for(int i=0;i<20;i++)
            new Skill(name:"Gradle",level: "basic").save()
        for(int i=0;i<1;i++)
            new Skill(name:"Maven",level: "basic").save()

        //Medium Skills
        for(int i=0;i<10;i++)
            new Skill(name:"Java",level: "medium").save()
        for(int i=0;i<7;i++)
            new Skill(name:"C#",level: "medium").save()
        for(int i=0;i<5;i++)
            new Skill(name:"Python",level: "medium").save()

        //Medium Skills
        for(int i=0;i<10;i++)
            new Skill(name:"Grails",level: "expert").save()
        for(int i=0;i<7;i++)
            new Skill(name:"HTML5",level: "expert").save()
        for(int i=0;i<5;i++)
            new Skill(name:"Angular",level: "expert").save()

    }

    def destroy = {
    }

}
