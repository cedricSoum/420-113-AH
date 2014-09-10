using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Jeu_de_Des
{
  public class De
    {
    
        private const int nbFaces = 6;

        private int face;

        private static Random générateurAléatoire = new Random();

        public De()   {
            Lancer();// FACE INITIALE
            InitializeComponent();
        }

        public De(int valeurInitiale)    {
            face = valeurInitiale;
        }

        //PROPRIÉTÉS
        public int NbFaces
        {    //EN LECTURE
            get { return nbFaces; }
        }

        public int Face
        {
            get { return face; }

            set   {
                if (value < 1 || value > NbFaces)
                    throw new ArgumentOutOfRangeException("Devrait être entre 1 et " + NbFaces);

                face = value;
            }

        }

        public void Lancer()     {
            Face = générateurAléatoire.Next(NbFaces) + 1;
        }

        public override string ToString()   {
            return Face.ToString();
        }
    }
}
