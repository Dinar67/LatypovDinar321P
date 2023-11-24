using PracticLatypov.Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using PracticLatypov.Pages;

namespace PracticLatypov.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddStudentExam.xaml
    /// </summary>
    public partial class AddDisciplineCafedra : Window
    {
        private Cafedra cafedra;
        public AddDisciplineCafedra(Cafedra _cafedra)
        {
            InitializeComponent();
            cafedra = _cafedra;
            DisciplineCb.ItemsSource = App.db.Discipline.Where(x => x.Shifr == null).ToList();
            
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Discipline discipline = DisciplineCb.SelectedItem as Discipline;

            if (discipline != null)
            {
                App.db.Discipline.Where(x => x.Kod == discipline.Kod).FirstOrDefault().Shifr = cafedra.Shifr;
                App.db.SaveChanges();
                MessageBox.Show("Запись добавлена");
                App.CafedraPage.CafedraDisciplineList.ItemsSource = App.db.Discipline.Where(x => x.Shifr == cafedra.Shifr).ToList();
                this.Close();
            }
            else
                MessageBox.Show("Вы не выбрали дисциплину");

        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
