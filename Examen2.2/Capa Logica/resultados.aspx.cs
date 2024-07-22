using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam_2.Capa_Logica
{
    public partial class resultados : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarResultados();
            }
        }

        private void MostrarResultados()
        {
           
            Dictionary<string, int> votosCandidatos = p2.votosCandidatos;

           
            List<object> resultados = new List<object>();
            foreach (var kvp in votosCandidatos)
            {
                resultados.Add(new { Candidato = kvp.Key, Votos = kvp.Value });
            }

            
            GridViewResultados.DataSource = resultados;
            GridViewResultados.DataBind();
        }
    }
}
