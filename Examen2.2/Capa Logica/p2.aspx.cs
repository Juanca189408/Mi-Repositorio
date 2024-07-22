using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Exam_2.Capa_Logica
{
    public partial class p2 : Page
    {
        
        public static Dictionary<string, int> votosCandidatos = new Dictionary<string, int>()
        {
            { "PIZA", 0 },
            { "FIGUERES", 0 },
            { "ALVARADO", 0 }
        };

        protected void btn1_Click(object sender, EventArgs e)
        {
            ProcesarVoto("PIZA");
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            ProcesarVoto("FIGUERES");
        }

        protected void btn3_Click(object sender, EventArgs e)
        {
            ProcesarVoto("ALVARADO");
        }

        private void ProcesarVoto(string candidato)
        {
            string usuarioId = ObtenerUsuarioId();

            try
            {
                if (!UsuarioYaVoto(usuarioId))
                {
                    
                    RegistrarVoto(usuarioId);

                    
                    votosCandidatos[candidato]++;

                    
                    Response.Redirect("menu.aspx");
                }
                else
                {
                    
                    lblMensajeError.Text = "Ya has votado.";
                }
            }
            catch (Exception ex)
            {
                
                lblMensajeError.Text = "Error: " + ex.Message;
            }
        }

        private bool UsuarioYaVoto(string usuarioId)
        {
           
            string connectionString = ConfigurationManager.ConnectionStrings["ExamenConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT HaVotado FROM Votos WHERE UsuarioId = @UsuarioId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsuarioId", usuarioId);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null && (bool)result)
                    {
                        return true;
                    }
                    return false;
                }
            }
        }

        private void RegistrarVoto(string usuarioId)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["ExamenConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Votos SET HaVotado = 1 WHERE UsuarioId = @UsuarioId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsuarioId", usuarioId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private string ObtenerUsuarioId()
        {
            
            return "guest";
        }
    }
}
