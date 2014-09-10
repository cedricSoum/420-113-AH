import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class BaseDeDonneeEx2 {
	private Connection con;

	public static void main(String argv[]){
		 @SuppressWarnings("unused")
		BaseDeDonneeEx2 cx = new BaseDeDonneeEx2();  
	}
	
	private BaseDeDonneeEx2(){
		initialiserConnection();
		sortirDonnees();
		closeConnection();
	}
	public void closeConnection(){
		try {
			con.close();
			}catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
	}                                                                                        
		
	public void initialiserConnection() {
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection( "jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
				} 
					catch (ClassNotFoundException cnfex) {
						System.err.println("�chec du chargement du pilote JDBC/ODBC.");
						cnfex.printStackTrace();
						System.exit(1); 
						} 
							catch (SQLException sqlex) {
								System.err.println("Connexion impossible");
								sqlex.printStackTrace();
								System.exit(1); 
							}
		}
	
	public void sortirDonnees() {
		
		try {   String sql = "SELECT * FROM EMP";
		        con = DriverManager.getConnection( "jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
				Statement statement = con.createStatement();
	            DatabaseMetaData dmd = con.getMetaData();
	            ResultSet tables = dmd.getTables(con.getCatalog(), null,"%",null);
				while (tables.next()){
				System.out.println("############################################");
				for(int i = 0; i< tables.getMetaData().getColumnCount(); i++){
                String nomColonne = tables.getMetaData().getColumnName(i+1);
                Object valeurColonne = tables.getObject(i+1);
                System.out.println(nomColonne+"="+valeurColonne);
				}
			    }
		}
				catch (SQLException sqlex) {
				System.err.println("Connexion impossible");
				sqlex.printStackTrace();
				System.exit(1); 
			}
		}
}
