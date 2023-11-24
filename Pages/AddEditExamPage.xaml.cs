using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using PracticLatypov.Components;
using PracticLatypov.Windows;

namespace PracticLatypov.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditExamPage.xaml
    /// </summary>
    public partial class AddEditExamPage : Page
    {
        private Exam exam;
        public AddEditExamPage(Exam _exam)
        {
            InitializeComponent();
            App.ExamPage = this;
            exam = _exam;
            IdTb.DataContext = exam;
            DateTb.DataContext = exam;
            DisciplineTb.DataContext = exam;
            AuditoryTb.DataContext = exam;
            ExamStudentList.ItemsSource = App.db.ExamStudent.Where(x => x.IdExam == exam.IdExam).ToList();
        }

        private void AddStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            new AddStudentExam(exam).ShowDialog();
        }

        private void DeleteStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            dynamic selectedItem = ExamStudentList.SelectedItem;
            string Id = selectedItem.RegNumber.ToString();
            if (Id != "" && Id != null)
            {
                ExamStudent examStudent = App.db.ExamStudent.Where(x => x.IdExam == exam.IdExam && x.RegNumber.ToString() == Id).FirstOrDefault();
                App.db.ExamStudent.Remove(examStudent);
                App.db.SaveChanges();
                ExamStudentList.ItemsSource = App.db.ExamStudent.Where(x => x.IdExam == exam.IdExam).ToList();
            }
            else
                MessageBox.Show("Вы не выбрали студента");
        }

        
    }
}
