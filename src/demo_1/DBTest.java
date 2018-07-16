package demo_1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class DBTest extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain;charset=utf-8");
		  String action=request.getParameter("action");	
		   String mark=request.getParameter("mark");
		   String user=request.getParameter("user");
		   if(action.equals("test")){
			  questionput(response);
		   }else if(action.equals("save")){ 
			  save(mark,user); 
		   }
		

	}
	public void questionput(HttpServletResponse response)throws ServletException, IOException{
		
		response.setContentType("text/plain;charset=utf-8");
		
		try {
			
			DBConnection b =new DBConnection();
			String sql = "select * from question";
			ResultSet rs = b.executeQuery(sql);
			
			
			int tid;
			String Q="";
			String A="";
			String B="";
			String C="";
			String D="";
			String answer="";
			ArrayList<question> Qlist = new ArrayList();
			while(rs.next()){
				 tid=rs.getInt(1);
				 Q = rs.getString(2);
				 A = rs.getString(3);
				 B = rs.getString(4);
				 C = rs.getString(5);
				 D = rs.getString(6);
				 answer = rs.getString(7);
				question t = new question(tid,Q,A,B,C,D,answer);
				Qlist.add(t);
			}
			b.close();
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
		    JSONObject jobj =new JSONObject();	
		    
		    Random r = new Random();
		    int j=0;
		    int ques[]= {-1,-1,-1,-1};
		    while(j<4) {
		    	int randnumber = r.nextInt(Qlist.size());
		    	if(exist(ques,randnumber))
		    	{ 
		    	 ques[j] = randnumber;
		    	 j++;
		    	}
		    } 
            
		    for(int i=0;i<4;i++){
              question q = Qlist.get(ques[i]);	
              JSONObject smalljobj =new JSONObject();
              smalljobj.put("Q",q.Q );
              smalljobj.put("A",q.A );
			  smalljobj.put("B",q.B );
			  smalljobj.put("C",q.C );
			  smalljobj.put("D",q.D );
			  smalljobj.put("answer",q.answer);
			  jobj.put(String.valueOf((i+1)), smalljobj);
            }
		    			
			out.print(jobj.toString());
			out.flush();
			out.close(); 
		}catch(Exception e){
			e.printStackTrace();
		}		
	}

	//将分数记录进数据库
	public void save(String mark,String user){
		DBConnection b = new DBConnection();
		String sql="insert into score(mark,user) values('"+mark+"','"+user+"')";
	    b.execute(sql);	
		
	}
	
	//检查重复题目
	public boolean exist(int ques[],int randnumber){
	  int count=0;
	  for(int i=0;i<4;i++){
	    if(randnumber!=ques[i])
	      count++;
	    else
	      break;
	  }
	  if(count==4)
	   return true;
	  else
	   return false;
	}	
}
		