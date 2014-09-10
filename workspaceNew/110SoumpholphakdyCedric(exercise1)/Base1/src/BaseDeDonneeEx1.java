import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class BaseDeDonneeEx1 {
	private Connection con;

	public static void main(String argv[]){
		 @SuppressWarnings("unused")
		BaseDeDonneeEx1 cx = new BaseDeDonneeEx1();  
	}
	
	private BaseDeDonneeEx1(){
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
						System.err.println("Échec du chargement du pilote JDBC/ODBC.");
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
				Statement statement = con.createStatement();
				ResultSet resultat = statement.executeQuery(sql);
				ResultSetMetaData metadata = resultat.getMetaData();
				
				for(int i = 0; i< metadata.getColumnCount(); i++){
					int index = i+1;
					int typeSQL = metadata.getColumnType(index); 
					String nomTypeSQL = metadata.getColumnTypeName(index); 
					String typeJava = metadata.getColumnClassName(index);
					
					System.out.println("\nINFORMATIONS SUR LA COLONNE D'INDEXE "+index);
					System.out.println("Type SQL dans java.sql.Types : "+typeSQL);
					System.out.println("Nom du type SQL : "+nomTypeSQL);
					System.out.println("Classe java correspondante : "+typeJava);
				}
			} catch (SQLException sqlex) {
				System.err.println("Connexion impossible");
				sqlex.printStackTrace();
				System.exit(1); 
			}
		}
}