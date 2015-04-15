# -*- encoding : utf-8 -*-
class MathTestsController < ApplicationController
  
  def index
    @math_tests = MathTest.where("release_date < '#{Time.now}'").reverse
    @last_math_test = MathTest.where("release_date < '#{Time.now}'").last
    #flash[:notice] = %Q[Задачи взяты из <a href="http://mathege.ru">Открытого банка заданий по математике mathege.ru</a>].html_safe
  end

  def show
    @math_test = MathTest.where("release_date < '#{Time.now}'").find_by_id(params[:id]) ||
                  MathTest.where("release_date < '#{Time.now}'").last
                
    if session[:id] != params[:id]
      session.delete :answers
      session.delete :answers_response
      session[:id] = params[:id]
    end
    
    session[:answers] ||= {}
    params[:answers] ||= {}
    session[:answers_response] ||= Hash.new('hand_left')
    session[:answers].update(params[:answers])
    
    @user_answers = session[:answers]
    if session[:answers].values.all? {|value| value.match(/\A-?\d+(,\d+)?\z/)}
      session[:answers].each { |key, value| session[:answers_response][key] = 
        if value.gsub(/,/, '.').to_d == eval("@math_test.#{key}_answer")
          "ok"
        elsif value.blank?
          "hand_left"
        else
          "remove"
        end
      }
    else
      flash[:alert] = "Ответом на каждое из заданий части является целое число или конечная десятичная дробь. Ответ следует записать в поле для ответов под выполняемым заданием. Дробную часть от целой отделяйте запятой. Единицы измерений писать не нужно."
      session[:answers].keep_if{ |key, value| value.match(/\A-?\d+(,\d+)?\z/) }
      session[:answers_response].keep_if{ |key, value| session[:answers].has_key?(key) }
      @user_answers = session[:answers]
      redirect_to @math_test
    end
    
  end

  def new
    @last_math_test = MathTest.last
    flash[:notice] = %Q[Правильность написания формул можно проверить на сайте <a href="http://mathb.in">Mathb.in</a>].html_safe
  end

  def edit
    @math_test = MathTest.find_by_id params[:id]
  end

  def create
    if (params[:math_test].select{|key, value| key.match(/\AB\d+_answer\z/) and value.match(/\A-?\d+(,\d+)?\z/)} and @math_test = MathTest.create(params[:math_test]))
      flash[:notice] = "Тренировочный вариант №#{@math_test.id} записан в базу данных"
      redirect_to math_tests_path
    else
      flash[:alert] = "Ответом на каждое из заданий части является целое число или конечная десятичная дробь. Ответ следует записать в поле для ответов под выполняемым заданием. Дробную часть от целой отделяйте запятой. Единицы измерений писать не нужно."
      #params[:math_test].select
      redirect_to new_math_test_path
    end
  end

  def update
    @math_test = MathTest.find_by_id params[:id]

    if (params[:math_test].values.all? {|value| value.match(/\A-?\d+(,\d+)?\z/)} and @math_test.update_attributes(params[:math_test]))
      flash[:notice] = "Тренировочный вариант №#{@math_test.id} обновлен"
      redirect_to @math_test
    else
      flash[:alert] = "Ответом на каждое из заданий части является целое число или конечная десятичная дробь. Ответ следует записать в поле для ответов под выполняемым заданием. Дробную часть от целой отделяйте запятой. Единицы измерений писать не нужно."
      flash.now
      render 'edit'
    end
  end

  def destroy
    @math_test = MathTest.find_by_id params[:id]
    if @math_test.destroy
      flash[:alert] = "Тренировочный вариант №#{@math_test.id} удален"
    end

    redirect_to math_tests_path
  end	
end
