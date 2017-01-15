package mybean.data;
import java.util.*;
public class Login {
   String logname="",backNews="Î´µÇÂ¼ ";
   LinkedList<String> car;
   public Login(){
	   car=new LinkedList<String>();
   }
public String getLogname() {
	return logname;
}
public void setLogname(String logname) {
	this.logname = logname;
}
public String getBackNews() {
	return backNews;
}
public void setBackNews(String backNews) {
	this.backNews = backNews;
}
public LinkedList<String> getCar() {
	return car;
}
public void setCar(LinkedList<String> car) {
	this.car = car;
}
}
