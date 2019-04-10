# food-blog-1
COSC 480 - Frank Food Blog team 1

### Team Meeting on 4/10
- Lauren & Liam: Devise Authentication, Image rendering 
- Adam & Eman: About Page (UI on whiteboard, can maybe do click on a username to see other people’s page?), comments integration username, post integration username, delete your own posts only !!!!!

### Sommers Meeting on 4/9

Pushing to Heroku (Meeting with Sommers 4/9/2019)
- Bundle install —without production
- Push to GitHub
- Address Warning with pushing to Heroku: Fix git ignore
- Push to GitHub
- Push to heroku
- Active storage issues are ok
- Push to Heroku
`Heroku run rake db:migrate --detached (check HW 3)`
- Allows it to run, shell is detached
`Heroku logs —app <heroku name> —dyno run.5443`
*Note: all things in development that seem like benign errors are catastrophic in Heroku
Note: need to put noimg in Git Repo.*

Forcing a save to fail (for coverage):
- If you are in a *create*, mock out Post.new so that @post variable is controlled by you
- On that object add a fake save method that just returns nil
- So when you hit save you controlled the method to get and return
- Same thing for update (needs to be modified so you’re setting @post = find(params[:id])

For images...get Sommers to set up a cloud storage. 

### Meeting on 3/30

Lauren & Liam ==> post model and index view
Adam & Eman ==> comment model and create view

- can be working on tests at the same time as writing code
- Sunday (3/31): have working version of code by 
- Monday (4/1): have versions of tests and code by 
- Tuesday (4/2): OFF to prep for exam
- Wednesday (4/3): meet on Wednesday, talk to client on Wednesday and touch base (4/3)
- Thursday (4/4): finishing touches
