using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; 

namespace Exam_2.Capa_Logica
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void B1_Click(object sender, EventArgs e)
        {
            string correo = Tcorreo.Text;
            string contrasena = Tcontrasena.Text;


            string connectionString = ConfigurationManager.ConnectionStrings["ExamenConnectionString"].ConnectionString;


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                
                string query = "SELECT COUNT(*) FROM Usuarios WHERE email = @email AND contraseña = @contraseña";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                   
                    command.Parameters.AddWithValue("@email", correo);
                    command.Parameters.AddWithValue("@contraseña", contrasena);

                    connection.Open();

                    
                    object result = command.ExecuteScalar();

                   
                    if (result != null)
                    {
                        int count = Convert.ToInt32(result);

                        if (count > 0)
                        {
                            
                            Session["LoggedIn"] = true;
                           
                            Response.Redirect("menu.aspx");
                        }

                        {

                            Response.Write("Correo o contraseña incorrectos.");
                        }
                    }
                    else
                    {
                    
                        Response.Write("Error al autenticar usuario.");
                    }
                }
            }
        }


    }
}
