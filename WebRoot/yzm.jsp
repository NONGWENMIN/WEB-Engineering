<%@page contentType="image/jpeg;charset=utf-8"%>
<%@page import="java.util.*,java.awt.*,java.awt.image.*,javax.imageio.*" %>
<%@ page import="java.io.OutputStream" %>
<html>
	<body>
		<%! 
			Color getRandColor(int fc,int bc)
			{
				Random rd=new Random();
				if(fc>255) fc=255;
				if(bc>255) bc=255;
				int red=fc+rd.nextInt(bc-fc);
				int green=fc+rd.nextInt(bc-fc);
				int blue=fc+rd.nextInt(bc-fc);
				return new Color(red,green,blue);
			}
		 %>
		 <% 
		 	Random r=new Random();
		 	response.addHeader("Pragma","No-cache");
		 	response.addHeader("Cache-Control","no-cache");
		 	response.addDateHeader("expires",0);		 
		 	int width=90;
		 	int height=23;
			BufferedImage pic=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
			Graphics gc=pic.getGraphics();
			gc.setColor(getRandColor(200,250));
			gc.fillRect(0,0,width,height);
			String[] rNum ={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f",
						"g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w",
						"x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N",
						"O","P","Q","R","S","T","U","V","W","X","Y","Z"};
			int[] style = {Font.PLAIN,Font.BOLD,Font.ITALIC,Font.PLAIN+Font.BOLD,
					Font.BOLD+Font.ITALIC,Font.PLAIN+Font.ITALIC,Font.PLAIN+Font.BOLD+Font.ITALIC};
			gc.setColor(Color.WHITE);
			gc.drawLine(0,30,90,10);
			gc.setColor(getRandColor(160,200));
			for (int i=0;i<50;i++)    //随机生成干扰的线条
			{
				int x = r.nextInt(width);    
				int y = r.nextInt(height);    
				int xl = r.nextInt(10);    
				int yl = r.nextInt(10);    
				gc.drawLine(x,y,x+xl,y+yl);    
			}
			gc.setColor(getRandColor(60,150));
			String rt = "";
			for(int i=0;i<4;i++){	//生成4个随机数
				String temp = rNum[r.nextInt(62)];
				rt = rt+temp;
				gc.setFont(new Font("Times New Roman",style[r.nextInt(7)],15));	//设置字体
				gc.drawString(temp,5+i*15+r.nextInt(10),10+r.nextInt(10));
			}
			gc.dispose();	//图像生效
			session.setAttribute("randNum",rt);			
			OutputStream os=response.getOutputStream();	//将图像输出到页面
			ImageIO.write(pic,"JPEG",os);
			System.out.println(session.getAttribute("randNum"));
			os.flush();
			os.close();
			os=null;
			response.flushBuffer();
			out.clear();
			out = pageContext.pushBody();
		  %>
	</body>
</html>