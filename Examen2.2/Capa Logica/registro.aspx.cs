using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Exam_2.Capa_Logica
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void B2_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ExamenConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Usuarios (id_usuario, email, contraseña, nombre, apellido) VALUES (@id_usuario, @correo, @contrasena, @nombre, @apellido)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id_usuario", Guid.NewGuid().ToString());
                cmd.Parameters.AddWithValue("@correo", Tcorreo.Text);
                cmd.Parameters.AddWithValue("@contrasena", Tcontrasena.Text);
                cmd.Parameters.AddWithValue("@nombre", Tnombre.Text);
                cmd.Parameters.AddWithValue("@apellido", Tapellido.Text);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    Response.Redirect("login.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

    }
}
