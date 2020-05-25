package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entidad.Mueble;
import util.MysqlDBConexion;

public class MuebleModel {
	public int insertaMueble(Mueble obj){
		int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = MysqlDBConexion.getConexion();
			String sql ="insert into mueble values(null,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setDouble(1, obj.getPrecio());
			pstm.setInt(2, obj.getStock());
			//La variable contiene el número de registros en la BD
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return salida;
	}
}
