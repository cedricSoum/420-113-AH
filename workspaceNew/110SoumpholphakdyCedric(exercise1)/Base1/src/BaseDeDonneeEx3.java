import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDeDonneeEx3 {

	private Connection con;

	public static void main(String argv[]) {
		BaseDeDonneeEx3 connexion = new BaseDeDonneeEx3();

	}

	public BaseDeDonneeEx3() {

		initialiserConnection();
		executerRequetes();
		closeConnection();
	}

	public void closeConnection() {
		try {
			con.close();
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
	}

	public void initialiserConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (ClassNotFoundException cnfex) {
			System.err.println("�chec du chargement du pilote JDBC/ODBC");
			cnfex.printStackTrace();
			System.exit(1);
		} catch (SQLException sqlex) {
			System.err.println("Connexion impossible");
			sqlex.printStackTrace();
			System.exit(1);
		}
	}

	public void executerRequetes() {
		try {

			ResultSet rs = null;
			Statement stmt = con.createStatement();
			String sql = "select * from activite";

			rs = stmt.executeQuery(sql);

			ResultSetMetaData rsmd = rs.getMetaData();

			int x = 0;
			while (x < rsmd.getColumnCount()) {
				x++;
				System.out.print(rsmd.getColumnName(x) + "\t");
			}
			System.out.println();

			while (rs.next()) {
				int noActivite = rs.getInt("NO_ACTIVITE");
				String nom = rs.getString("NOM");
				int montant = rs.getInt("MONTANT");
				int duree = rs.getInt("DUREE");
				System.out.println(noActivite + "\t" + nom + "\t" + montant
						+ "\t" + duree);
			}
		} catch (SQLException sqlex) {
			System.err.println("Connexion impossible");
			sqlex.printStackTrace();
			System.exit(1);
		}

	}
}