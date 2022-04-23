using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;
using Entity;
using Entity.dbo;

namespace Web.Pages.Cliente
{
    public class EditModel : PageModel
    {
        private readonly IClienteService Cliente;
        private readonly ITipoClienteService TipoCliente;

        public EditModel(IClienteService Cliente, ITipoClienteService TipoCliente)
        {
            this.Cliente = Cliente;
            this.TipoCliente = TipoCliente;
        }

        [BindProperty(SupportsGet = true)]
        public int? id { get; set; }

        [BindProperty]
        public ClienteEntity Entity { get; set; } = new ClienteEntity();

        public IEnumerable<TipoClienteEntity> TipoClienteLista { get; set; } = new List<TipoClienteEntity>();
        public async Task<IActionResult> OnGet()
        {

            try
            {
                 if(id.HasValue)
                {

                    Entity = await Cliente.GETBYID(new() {
                    IdCliente=id
                    });
                }

                TipoClienteLista = await TipoCliente.GETLISTA();

                return Page();
            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }

        }

        public async Task<IActionResult> OnPostAsync()
        {
            try
            {
                if (Entity.IdCliente.HasValue)
                {
                    var result = await Cliente.UPDATE(Entity);

                    if (result.CodeError != 0) throw new Exception(result.MsgError);
                    TempData["Msg"] = "El registro se actualizó correctamente";
                }
                else //Insertar
                {
                    var result = await Cliente.CREATE(Entity);

                    if (result.CodeError != 0) throw new Exception(result.MsgError);
                    TempData["Msg"] = "El registro se agregó correctamente";

                }


                return RedirectToPage("Grid");

            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }
        
        }


    }
}
