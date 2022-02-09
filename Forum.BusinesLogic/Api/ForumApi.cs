using Forum.BusinessLogic.NHibernate;
using Forum.BusinesLogic.Api.Interface;
using Forum.BusinesLogic.Communication;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using NHibernate;

namespace Forum.BusinesLogic.Api
{
    public class ForumApi : BaseApi, IForum
    {
        public void TestNHibernate()
        {

            try
            {
                using (var session = NHibernateBase.Session)
                {
                    using (var transaction = session.BeginTransaction())
                    {
                        var proffesion = session.Get<User>(1);
                        var user = proffesion;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("BŁĄD " + e);
            }
        }

        #region UserMethods

        public void RegisterUser(User user)
        {
            using (var session = NHibernateBase.Session)
            {
                using(var transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Save(user);
                        transaction.Commit();
                    }
                    catch(Exception)
                    {
                        transaction.Rollback();
                    }
                }
            }
        }

        public bool LoginUser(string username, string password)
        {
            using (var session = NHibernateBase.Session)
            {
                User tmpUser = GetUser(username);
                if (tmpUser != null)
                {
                    if(tmpUser.Password == password)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
        }

        public User GetUser(string username)
        {
            using (var session = NHibernateBase.Session)
            {
                IList<User> tmpUser = session.Query<User>().Where(c => c.Username == username).ToList();
                return tmpUser[0];
            }
        }

        public User GetUser(int id)
        {
            using (var session = NHibernateBase.Session)
            {
                User tmpUser = session.Get<User>(id);
                //IList<User> tmpUser = session.Query<User>().Where(c => c.Id == id).ToList();
                return tmpUser;
            }
        }

        public ServiceResponse UpdateUserData(User user)
        {
            using (var session = NHibernateBase.Session)
            {
                using (var transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.SaveOrUpdate(user);
                        transaction.Commit();
                        return new ServiceResponse() { Succes = true, Message = "Pomyślnie zaktualizowano dane!" };
                    }
                    catch (Exception e)
                    {
                        transaction.Rollback();
                        return new ServiceResponse() { Succes = false, Message = $"Dane nie zostały zaktualizowane! Błąd:   {e.Message}" };
                    }

                }
            }
        }


        public ServiceResponse DeleteUserAccount(User user)
        {
            using (var session = NHibernateBase.Session)
            {
                using (var transaction = session.BeginTransaction())
                {
                    try
                    {
                        User currentUser = session.Get<User>(user.Id);
                        session.Delete(currentUser);
                        transaction.Commit();
                        return new ServiceResponse() { Succes = true };
                    }
                    catch (Exception e)
                    {
                        transaction.Rollback();
                        return new ServiceResponse() { Succes = false, Message = $"Błąd podczas usuwania konta: {e.Message}" };
                    }

                }
            }
        }

        #endregion

        #region ValidationsMethods

        public ServiceResponse Validate_ChangePassword(string currentUser, string oldPass, string newPass1, string newPass2)
        {
            if(oldPass != "")
            {
                if (LoginUser(currentUser, oldPass))
                {
                    if (newPass1 == newPass2)
                    {
                        if (newPass1 != oldPass)
                        {
                            return Validate_Password(newPass1);
                        }
                        else
                        {
                            return new ServiceResponse() { Succes = false, Message = "Nowe hasło nie może być takie samo jak stare." };
                        }
                    }
                    else
                    {
                        return new ServiceResponse() { Succes = false, Message = "Nowe hasła nie są jednakowe." };
                    }
                }
                else
                {
                    return new ServiceResponse() { Succes = false, Message = "Stare hasło jest nieprawidłowe." };
                }
            }
            else
            {
                return new ServiceResponse() { Succes = true };
            }

        }

        public ServiceResponse Validate_Email(string email)
        {
            var pattern = new Regex(@"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])");

            if (pattern.IsMatch(email))
            {
                return new ServiceResponse() { Succes = true };
            }
            else
            {
                return new ServiceResponse() { Succes = false, Message = "Podany adres email jest nieprawidłowy;" };
            }
        }

        public ServiceResponse ValidateUsername(string username)
        {
            using (var session = NHibernateBase.Session)
            {
                IList<User> tmpUser = session.Query<User>().Where(c => c.Username == username).ToList();
                if (tmpUser.Count > 0)
                {
                    return new ServiceResponse() { Succes = false, Message = "Ta nazwa użytkownika jest już zajęta!" };
                }
                else return new ServiceResponse() { Succes = true };
            }
        }

        public ServiceResponse Validate_Password(string password)
        {
            //#### PASSWORD CONDITIONS: #############
            int minPasswordLenght = 8;
            bool mustHaveUpperCaseLetter = true;
            bool mustHaveSpecialCharacter = false;
            //#######################################

            int validConditions = 0;
            int requiredValidConditions = 1;
            string passwordWarning = "";

            if (password.Length >= minPasswordLenght)
            {
                validConditions++;
            }
            else
            {
                passwordWarning += $" Hasło musi składać się z minimum {minPasswordLenght} liter. \n";
            }

            if (mustHaveUpperCaseLetter)
            {
                requiredValidConditions++;
                foreach (char letter in password)
                {
                    if (letter >= 'A' && letter <= 'Z')
                    {
                        validConditions++;
                        break;
                    }
                    else
                    {
                        passwordWarning += " Hasło musi zawierać co najmniej 1 dużą literę. \n";
                        break;
                    }
                }
            }

            if (mustHaveSpecialCharacter)
            {
                requiredValidConditions++;
                char[] specialChars = { '@', '#', '$', '%', '^', '&', '+', '=' };
                if (password.IndexOfAny(specialChars) != -1)
                {
                    validConditions++;
                }
                else
                {
                    passwordWarning += " Hasło musi zawierać przynajmniej 1 znak specjalny: @ # $ % ^ & + =. \n";
                }
            }

            if (validConditions == requiredValidConditions)
            {
                return new ServiceResponse() { Succes = true };
            }
            else
            {
                return new ServiceResponse() { Succes = false, Message = passwordWarning };
            }
        }

        #endregion

        #region PostMethods

        public ServiceResponse AddPost(Post post)
        {
            using (var session = NHibernateBase.Session)
            {
                using (var transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Save(post);
                        transaction.Commit();
                        return new ServiceResponse() { Succes = true };
                    }
                    catch (Exception e)
                    {
                        transaction.Rollback();
                        return new ServiceResponse() { Succes = false, Message = $"Nie udało się dodać posta! {e}"};
                    }
                }
            }
        }

        public int GetPostsCount()
        {
            using (var session = NHibernateBase.Session)
            {
                return session.Query<Post>().Count();
            }
        }

        // Zwraca daną ilość postów dla danej strony 
        // np. przy maksymalnej ilości postów na stronie 3
        // będzie zwracał:
        // dla strony 1 posty od 1 do 3
        // dla strony 2 posty od 4 do 6 itd...
        public IList<Post> GetPosts(int pageNumber, int postsInPage)
        {
            using (var session = NHibernateBase.Session)
            {
                int firstNumber = (postsInPage * pageNumber) - (postsInPage - 1);
                int secondNumber = firstNumber + postsInPage - 1;
                string query = $"SELECT Id,Title,Contents,AuthorId,Date FROM ( SELECT *, ROW_NUMBER() OVER(ORDER BY Date) AS row FROM Post )a WHERE row BETWEEN {firstNumber} AND {secondNumber}";
                var result = session.CreateSQLQuery(query)
                    .AddEntity(typeof(Post));
                return result.List<Post>();
            }
        }

        public Post GetPost(int postId)
        {
            using (var session = NHibernateBase.Session)
            {
                IList<Post> tmpPost = session.Query<Post>().Where(c => c.Id == postId).ToList();
                return (tmpPost != null) ? tmpPost[0] : null;
            }
        }

        #endregion

        #region AnswerMethods

        public IList<Answer> GetPostAnswers(int currentPostId)
        {
            using (var session = NHibernateBase.Session)
            {
                var answers = session.Query<Answer>().Where(x => x.PostId.Id == currentPostId).ToList();
                return answers;
            }
        }


        public bool AddAnswer(Answer answer)
        {
            using (var session = NHibernateBase.Session)
            {
                try
                {
                    session.Save(answer);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
                
            }
        }

        #endregion

    }
}
