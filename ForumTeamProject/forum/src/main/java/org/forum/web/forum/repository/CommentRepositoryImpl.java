package org.forum.web.forum.repository;

import org.forum.web.forum.exceptions.EntityNotFoundException;
import org.forum.web.forum.models.Comment;
import org.forum.web.forum.models.Like;
import org.forum.web.forum.repository.contracts.CommentRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepositoryImpl implements CommentRepository {

    private final SessionFactory sessionFactory;

    @Autowired
    public CommentRepositoryImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void create(Comment comment) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(comment);
            session.getTransaction().commit();
        }

    }

    @Override
    public void update(Comment comment) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.merge(comment);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(Like like) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.remove(like);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Comment> getAll() {
        try (Session session = sessionFactory.openSession()) {
            Query<Comment> query = session.createQuery("SELECT c FROM Comment c WHERE c.isDeleted = false", Comment.class);
            return query.list();
        }
    }

    @Override
    public List<Comment> getPostComments(int postId) {
        try (Session session = sessionFactory.openSession()) {
            Query<Comment> query = session.createQuery("SELECT c FROM Comment c WHERE c.post.id = :postId and c.isDeleted = false", Comment.class)
                    .setParameter("postId", postId);
            return query.list();
        }
    }

    @Override
    public Comment getById(int id) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();

            Comment comment = session.createQuery(
                            "SELECT c FROM Comment c LEFT JOIN FETCH c.likedList WHERE c.id = :id AND c.isDeleted = false", Comment.class)
                    .setParameter("id", id)
                    .uniqueResult();

            if (comment == null) {
                throw new EntityNotFoundException("Comment", id);
            }

            transaction.commit();
            return comment;
        }
    }

    @Override
    public long commentLikesCount(int commentId) {
        try (Session session = sessionFactory.openSession()) {
            Long likeCount = session.createQuery(
                            "SELECT COUNT(lc) FROM Like lc WHERE lc.comment.id = :id AND lc.isLiked = true AND lc.isDeleted = false",
                            Long.class
                    )
                    .setParameter("id", commentId)
                    .uniqueResult();

            return likeCount != null ? likeCount : 0;
        }
    }

//    @Override
//    public long commentDislikesCount(int commentId) {
//        try (Session session = sessionFactory.openSession()) {
//            Long likeCount = session.createQuery(
//                            "SELECT COUNT(lc) FROM Like lc WHERE lc.comment.id = :id AND lc.isLiked = false AND lc.isDeleted = false",
//                            Long.class
//                    )
//                    .setParameter("id", commentId)
//                    .uniqueResult();
//
//            return likeCount != null ? likeCount : 0;
//        }
//    }


}
